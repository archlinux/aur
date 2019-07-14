# Maintainer: Yuval Adam <aur at yuv dot al> PGP-Key: 55E36E28535222E2A2062848B75B5FC2FA1AFE15

pkgname=pygreat-git
pkgver=v2019.5.1.dev0.6.g1e982b2
pkgrel=1
pkgdesc="A library to help you do Great things"
arch=('any')
url="https://github.com/yuvadm/libgreat"
license=(BSD)
depends=('python-pyusb' 'python-future')
provides=('pygreat')
source=("git+${url}")
sha1sums=('SKIP')
_gitname=libgreat

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

package() {
  cd "${_gitname}/host"
  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

# vim:set ts=2 sw=2 et:
