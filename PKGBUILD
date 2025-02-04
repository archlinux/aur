# Maintainer: Sigurd Hellesvik <sigurd.hellesvik@protonmail.com>

# Disclaimer: This package is not from Nordic Semiconductor
pkgname=nrf-connect-sdk-installer
pkgver=0.2
pkgrel=2
pkgdesc="Installer script for the Nordic Semiconuctor nRF Connect Software Developement Kit (SDK)."
arch=('x86_64')
url="https://gitlab.com/hellesvik/${pkgname}"
license=('BSD')
# Dependencies are not only needed for the installer script, but also to build for the nRF Connect SDK
depends=(
'git'
'cmake'
'ninja'
'gperf'
'dfu-util'
'dtc'
'python'
'python-setuptools'
'tk'
'python-wheel'
'xz'
'python-intelhex'
'python-pyelftools' 
#AUR dependencies
'zephyr-sdk'
'python-west'
'python-nrf_regtool'
'nrfutil'
'nrf5x-command-line-tools'
)
makedepends=(
'help2man'
)
#All Python dependencies are from the nRF Connect SDK Python requirements.
#They are described in the documentation at 
#https://developer.nordicsemi.com/nRF_Connect_SDK/doc/1.8.0/nrf/gs_installing.html#id9
#The packages from those scripts found in pacman/AUR is listed below
optdepends=(
'ccache: Listed in nRF Connect SDK install dependencies'
'gn: Matter support'
'python-ecdsa: nrf-sdk requirements-build.txt'
'python-imagesize: nrf-sdk requirements-build.txt'
'python-pylint: nrf-sdk requirements-build.txt'
'python-regex: nrf-sdk requirements-build.txt' 
'python-recommonmark: nrf-sdk requirements-docs.txt '
'python-commonmark: nrf-sdk requirements-docs.txt'
'python-sphinx: nrf-sdk requirements-docs.txt'
'python-pygments: nrf-sdk requirements-docs.txt'
'python-m2r2: nrf-sdk requirements-docs.txt'
'python-sphinxcontrib-plantuml: nrf-sdk requirements-docs.txt'
'python-pygit2: nrf-sdk requirements-docs.txt'
'python-azure-storage: nrf-sdk requirements-docs.txt'
'python-sphinx-markdown-tables: nrf-sdk requirements-docs.txt'
'python-markdown: nrf-sdk requirements-docs.txt'
'python-mistune: nrf-sdk requirements-docs.txt'
'python-pyaml: zephyr-sdk requirements-base.txt'
'python-pykwalify: zephyr-sdk requirements-base.txt'
'python-packaging: zephyr-sdk requirements-base.txt'
'python-progress: zephyr-sdk requirements-base.txt'
'python-psutil: zephyr-sdk requirements-base.txt'
'python-anytree: zephyr-sdk requirements-base.txt'
'pylink: zephyr-sdk requirements-base.txt'
'python-colorama: zephyr-sdk requirements-build-test.txt'
'python-ply: zephyr-sdk requirements-build-test.txt'
'gcovr: zephyr-sdk requirements-build-test.txt'
'python-coverage: zephyr-sdk requirements-build-test.txt'
'python-pytest: zephyr-sdk requirements-build-test.txt'
'mypy: zephyr-sdk requirements-build-test.txt'
'python-mock: zephyr-sdk requirements-build-test.txt'
'python-breathe: zephyr-sdk requirements-doc,txt'
'python-sphinx_rtd_theme: zephyr-sdk requirements-doc,txt'
'python-pyserial: zephyr-sdk requirements-run-tests,txt'
'pyocd: zephyr-sdk requirements-run-tests.txt'
'python-tabulate: zephyr-sdk requirements-run-tests.txt'
'python-magic: zephyr-sdk requirements-compliance.txt'
'python-cryptography: mcuboot-sdk requirements.txt'
'python-clic: mcuboot-sdk requirements.txtk'
'python-cbor: mcuboot-sdk requirements.txt'
)
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://gitlab.com/hellesvik/${pkgname}/-/archive/v${pkgver}/nrf-connect-sdk-installer-v${pkgver}.tar.gz")
sha256sums=('091c4d01648b602b42803f9edd7aac0e920e319e237cdf70ec0a1ae81c26be0c')
sha256sums=('79f3b9df16d8195b128e1ed5967892dd881abdccc65cb32d45ea467bfbc8e4d1')

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}
