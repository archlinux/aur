# Maintainer: Sean Snell <ssnell@lakecs.net>

pkgname=jack_mixer_cc
pkgver=0.3
pkgrel=2
pkgdesc="A companion for jack_mixer that provides CLI control for channel adjustments"
arch=('any')
url="https://github.com/sen87/jack_mixer_cc"
license=('GNU')
depends=('python-pillow' 'python-jack-client' 'jack_mixer')
optdepends=('dbus-python: for jack_mixer_cc_client.py notifications')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sen87/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "jack_mixer_cc.service")

# Upstream tar.gz
# jack_mixer_cc.service

sha512sums=('4ff9197f39bf5baf3c516d31473d20c31f2aa6b2e6ab1804da6f927519554f8b4d8252b0649b9e6c9dd348e2c511391de096d1d2163d7854e17dba9a9d3b31b0'
            '203d673279c95bf40c712259e5eed9f11dc27748f21bfe0d431fd3b74d7aaea702e66d095df54e7e40d0e94dca4ced52307e4fdeab8afda50d6f4ab7a2166305')

package() {
  # cd "${pkgname}-${pkgver}"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/jack_mixer_cc_client.py" "${pkgdir}/usr/bin/jack_mixer_cc/jack_mixer_cc_client.py"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/jack_mixer_cc.py" "${pkgdir}/usr/bin/jack_mixer_cc/jack_mixer_cc.py"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 "${srcdir}/jack_mixer_cc.service" "${pkgdir}/etc/systemd/user/jack_mixer_cc.service"
}
