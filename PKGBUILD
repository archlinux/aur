# Maintainer: Phillip Schichtel <phillip@schich.tel>

pkgname=docker-forward
pkgver=1
pkgrel=1
pkgdesc="A docker CLI plugin to forward local port to a container port"
arch=('any')
url="https://github.com/pschichtel/docker-forward"
license=('GPL3')
depends=('bash' 'socat' 'docker')
source=(https://raw.githubusercontent.com/pschichtel/docker-forward/v${pkgver}/docker-forward.sh
        https://raw.githubusercontent.com/pschichtel/docker-forward/v${pkgver}/LICENSE)
sha256sums=('e9e990d3b31d1c16bc6f8e86ae12e475ae09a13e2f13476414ab2cd118245811'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  cd "${srcdir}"

  install -D -m755 docker-forward.sh "${pkgdir}/usr/lib/docker/cli-plugins/docker-forward"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/docker-forward/LICENSE"
}

