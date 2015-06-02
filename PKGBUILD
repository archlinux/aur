# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
# Contributor: Haoyu Bai <baihaoyu@gmail.com>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=umit
pkgver=1.0
pkgrel=1
pkgdesc="A powerful nmap frontend."
arch=('i686' 'x86_64' 'ppc')
url="http://www.umitproject.org/"
license=('GPL')
depends=('python2' 'pygtk' 'nmap' 'python2-pysqlite')
makedepends=('python2')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2"
        'setup.patch')
md5sums=('68412d8d50dafd53e0392f71ed62dcfc'
         'a1e1b57443c92e716b881bdb347fe091')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  patch -p0 < "$srcdir"/setup.patch
} 

package() {
  cd "$srcdir"/$pkgname-$pkgver

  python2 setup.py install --root="$pkgdir" --install-lib=usr/share/umit
}

# vim:set ts=2 sw=2 et:
