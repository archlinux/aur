# Maintainer: Raphael Nestler <raphael.nestler@gmail.com>
pkgname=thinkpad-p14s
pkgver=0.1.1
pkgrel=1
pkgdesc="Utilities and dependencies for a Thinkpad P14s laptop"
arch=('any')
url="https://github.com/rnestler/archpkg-thinkpad-p14s"
license=('GPL')
depends=('bash' 'amd-ucode')
optdepends=(
  'acpi_call: Allow to configure battery charging behavior'
)
source=('fix-tp-mic-led.sh' 'fix-tp-mic-led.service')
sha256sums=('e333bd4961d2145959f1f84d04935ae29e42663d94024a280f083c24fa3cfede'
            '331feb49d38fa941eef58be53c351faf1e332282496b1f4907300b4ea46abdbf')

package() {
  install -Dm755 "${srcdir}/fix-tp-mic-led.sh" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/fix-tp-mic-led.service" -t "${pkgdir}/usr/lib/systemd/system/"
}
