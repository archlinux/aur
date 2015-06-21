#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=cronwhip
pkgver=2015
pkgrel=1
pkgdesc='Run missed cronjobs.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/cronwhip"
depends=(python3 sysvinit-tools)
source=(
  http://xyne.archlinux.ca/projects/cronwhip/src/cronwhip-2015.tar.xz
  http://xyne.archlinux.ca/projects/cronwhip/src/cronwhip-2015.tar.xz.sig
)
sha512sums=(
  b6650373d47207e7bee854aa05141b99b593b8575c4291ff5a9aaca0d9225589303ebcd7096bf7e8d608d1a809bfa822ea30671d68eaf9aa8b89a8824ec3884f
  0c96508197a05ca3ea2052e4e6d0947a7e9421d29a414ac90dcd693acad49ff26638bd2d7e0d7cfcf85a297f03abb8994c399a8a88d9f6d6faa972316c7fdb94
)
md5sums=(
  d6b36c5f541e20ed64f05d0adaffae3b
  9b2c7b452259b9b6adfd1aa45c097ff3
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 cronwhip "${pkgdir}/usr/bin/cronwhip"
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

# vim: set ts=2 sw=2 et:
