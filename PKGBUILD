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

pkgname=freshwall
pkgver=1.1.2
pkgrel=4
pkgdesc="Wallpaper rotator for Gnome using files found in ~/.gnome2/backgrounds.xml"
arch=(any)
url="https://www.sapphirepaw.org/projects/freshwall.html"
license=('Apache')
depends=('python2>=2.4')
source=("http://pypi.python.org/packages/source/f/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('bf8911f94ab37766f64bfd5c1f39cb30')

package() {
  cd "$srcdir"/$pkgname-$pkgver

  msg "Creating dirs..."
  install -dm755 "$pkgdir"/usr/bin/
  install -dm755 "$pkgdir"/usr/lib/python2.6/site-packages/$pkgname/
  
  msg "Copying files..."
  cp bin/* "$pkgdir"/usr/bin/
  cp lib/$pkgname/* "$pkgdir"/usr/lib/python2.6/site-packages/$pkgname/
  
  msg "Forcing usage of python2"
  sed -e 's|^#!/usr/bin/env python$|#!/usr/bin/python2|g' \
      -i "$pkgdir"/usr/bin/*

  msg "Setting permissions..."
  chmod 755 "$pkgdir"/usr/bin/*
}

# vim:set ts=2 sw=2 et:
