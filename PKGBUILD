# Maintainer: Phillip Smith <pkgbuild@phs.id.au>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=apache-mod_form
pkgver=1.0
pkgrel=1
pkgdesc="A utility to decode data submitted from Web forms. It deals with both GET and POST methods where the data are encoded using the default content type application/x-www-form-urlencoded."
arch=('i686' 'x86_64')
url="http://apache.webthing.com/mod_form/"
license=('GPL')
depends=('apache')
makedepends=('patch')
source=("http://apache.webthing.com/svn/apache/forms/mod_form.c"
        "http://apache.webthing.com/svn/apache/forms/mod_form.h")
sha256sums=('fea0d16ad45be310658bc623d9d9ad9d82bd3f4aedc80ecb969a534b56124437'
            '70bd77cbce33c2031890a4c7cc4e069555aa2d15bb2a9c432f947005bdb82d49')

build() {
  cd "$srcdir"/$pkgname-$pkgversion

  apxs -c mod_form.c
}

package() {
  cd "$srcdir"/$pkgname-$pkgversion

  install -Dm0755 .libs/mod_form.so $pkgdir/usr/lib/httpd/modules/mod_form.so
  install -Dm0644 mod_form.h $pkgdir/usr/include/httpd/mod_form.h
}

# vim:set ts=2 sw=2 et:
