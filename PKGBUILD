# Maintainer: Raphael Nestler <raphael.nestler@gmail.com>
pkgname=thinkpad-p14s
pkgver=0.1.0
pkgrel=2
pkgdesc="Utilities and dependencies for a Thinkpad P14s laptop"
arch=('any')
url="https://aur.archlinux.org/"
license=('GPL')
depends=('bash' 'amd-ucode')
optdepends=(
  'acpi_call: Allow to configure battery charging behavior'
)
source=('fix-tp-mic-led.sh' 'fix-tp-mic-led.service')
sha256sums=('e333bd4961d2145959f1f84d04935ae29e42663d94024a280f083c24fa3cfede'
            'a9062c04ee8b1fdeffce0c0c6765bf20c72c23bdc38338a4493a6f52697ba9e4')

package() {
  install -Dm755 "${srcdir}/fix-tp-mic-led.sh" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/fix-tp-mic-led.service" -t "${pkgdir}/usr/lib/systemd/system/"
}
