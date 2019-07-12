# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Zack Baldwin <zack@zackb.com>

pkgname=fanshim
pkgver=0.0.2
pkgrel=2
pkgdesc="Automatic control of Pimoroni Fan Shim for Raspberry Pi."
arch=('any')
url="https://github.com/pimoroni/fanshim-python"
license=('MIT')
depends=('python-fanshim')

source=("fanshim-${pkgver}-${pkgrel}.py::https://raw.githubusercontent.com/pimoroni/fanshim-python/master/examples/automatic.py"
        'fanshim.service')

sha512sums=('d9f29a6e4966d2d740ffa2357bb3c62cc71a3dec0ec57813101d0633fd3326643473af2edcc0249a38d21d0df6afb07fe21a0a1273898a9e95777f1b8334b43f'
            '7dd5b37cd81a7001d5f3d09461889294b6b38bcfb7274a4a5c0c558492454ad58bb03822de1ce023c7221b91886f5eff0b07a56ea88a34774e971a4ee1773b26')

package() {
  install -D -m 755 "${srcdir}/fanshim-${pkgver}.py" "${pkgdir}/usr/bin/fanshim"
  install -D -m 644 "${srcdir}/fanshim.service" "${pkgdir}/usr/lib/systemd/system/fanshim.service"
}

# vim:set ts=2 sw=2 et:
