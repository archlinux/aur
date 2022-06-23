# Maintainer: Petrus <petrus@dismail.de>

pkgname=mailctl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.3.1
pkgrel=1
pkgdesc="Provide OAuth2 renewal and authorization capabilities"
arch=(x86_64)
url="https://github.com/pdobsan/${_pkgname}"
license=('BSD')
groups=()
depends=(gnupg pass fdm msmtp)
makedepends=()
optdepends=('gnome-keyring: Stores passwords and encryption keys'
           )
provides=(${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-git)
source=(https://github.com/pdobsan/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-Linux
        https://github.com/pdobsan/${_pkgname}/releases/download/${pkgver}/${_pkgname}-0.3.1-Linux.sha256
        https://github.com/pdobsan/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz
       )
noextract=(${_pkgname}-${pkgver}-Linux ${_pkgname}-0.3.1-Linux.sha256)
sha256sums=('dc9cdf1eaf500abc1d306bbb0383efc159b2b01f7bb453fc664e2c0f7e69dbc1'
            'ac7aa267cacb2c0ee03b5eb56800e356c2d495fab19ce04e03d5f4d95a798dac'
            'fa4ce2649b83daa0c3312314ebc71a7b96be3b6d187ac842b87fc214e53199f8')

package() {
  install -Dm755 ${_pkgname}-${pkgver}-Linux ${pkgdir}/usr/bin/${_pkgname}
  cd $_pkgname-$pkgver
  install -Dm644 LICENSE ${pkgdir}/usr/share/${_pkgname}/LICENSE
  install -Dm644 README.md ${pkgdir}/usr/share/${_pkgname}
  cp -r configs ${pkgdir}/usr/share/${_pkgname}
}
