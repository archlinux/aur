# Maintainer: phlppbmm <philipp.baumm@gmx.net>
pkgname=python-agent-rtfm-bin
pkgver=0.1.1
pkgrel=2
pkgdesc="Local documentation retrieval service for agent-assisted development (prebuilt)"
arch=('any')
url="https://github.com/phlppbmm/rtfm"
license=('MIT')
depends=('python>=3.11')
makedepends=('python-pip')
provides=('python-agent-rtfm')
conflicts=('python-agent-rtfm' 'python-agent-rtfm-git')
options=('!strip')

package() {
    PIP_CONFIG_FILE=/dev/null pip install \
        --root="${pkgdir}" \
        --prefix=/usr \
        --no-warn-script-location \
        --disable-pip-version-check \
        --no-cache-dir \
        "agent-rtfm==${pkgver}"
}
