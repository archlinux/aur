# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Zack Baldwin <zack@zackb.com>

pkgname=fanshim
pkgver=0.0.2
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/pimoroni/fanshim-python"
license=('MIT')
depends=('python-fanshim')

source=("fanshim-${pkgver}.py::https://raw.githubusercontent.com/pimoroni/fanshim-python/master/examples/automatic.py"
        'fanshim.service')

sha512sums=('cfcd1e32bf1e632dc10e555a0952f7582a68f3b677cc4753617e4e26d48034fece0694d6aeb8224ec7d2397779aa07faa978fc79e6b9b0391f17594a8f0439e0'
            '2911e69d15ce604def3456ff4b5fe62531e4b0c16eecbc31fbeea92c29d4aa5de5866f81653bca2c7c953499a58c630f640a95ecf5e03156cb17bb804f793773')

package() {
  install -D -m 755 "${srcdir}/fanshim-${pkgver}.py" "${pkgdir}/usr/bin/fanshim"
  install -D -m 644 "${srcdir}/fanshim.service" "${pkgdir}/usr/lib/systemd/system/fanshim.service"
}

# vim:set ts=2 sw=2 et:
