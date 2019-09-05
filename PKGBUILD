# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Zack Baldwin <zack@zackb.com>

pkgname=fanshim
pkgver=0.0.2
pkgrel=3
pkgdesc="Automatic control of Pimoroni Fan Shim for Raspberry Pi."
arch=('any')
url="https://github.com/pimoroni/fanshim-python"
license=('MIT')
depends=('python-fanshim')

source=("fanshim-${pkgver}-${pkgrel}.py::https://raw.githubusercontent.com/pimoroni/fanshim-python/master/examples/automatic.py"
        'fanshim.service')

sha512sums=('35db868516da1d5ba5f4d337de3fa0c43b210d4b4a6e37efba45801e12f88c7c0e66d39c5307f98811f3268af2b2bc69a9cc476b8986abc699aed2ff0e6b0ae0'
            '7dd5b37cd81a7001d5f3d09461889294b6b38bcfb7274a4a5c0c558492454ad58bb03822de1ce023c7221b91886f5eff0b07a56ea88a34774e971a4ee1773b26')

package() {
  install -D -m 755 "${srcdir}/fanshim-${pkgver}-${pkgrel}.py" "${pkgdir}/usr/bin/fanshim"
  install -D -m 644 "${srcdir}/fanshim.service" "${pkgdir}/usr/lib/systemd/system/fanshim.service"
}

# vim:set ts=2 sw=2 et:
