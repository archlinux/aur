# Maintainer: Excalibur <saberconer at gmail dot com>

pkgname=python-aiot-tools-git
pkgver=1.3.1.dev7+gbc65b89
pkgrel=1
pkgdesc='AIoT tools for flashing boards using MediaTek AIoT SoCs.'
url='https://gitlab.com/mediatek/aiot/bsp/aiot-tools'
arch=('any')
license=('MIT')
depends=(
    'python'
    'python-aiot-bootrom'
    'python-gpiod'
    'python-oyaml'
    'python-packaging'
    'python-pyftdi'
    'python-pyusb'
    'python-pyudev'
)
makedepends=('python-setuptools')
provides=('python-aiot-tools')
conflicts=('python-aiot-tools')
source=("${pkgname}::git+https://gitlab.com/mediatek/aiot/bsp/aiot-tools.git")
md5sums=(SKIP)

build() {
	cd "${pkgname}"
	python setup.py build
}

package() {
	cd "${pkgname}"
	python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 README.md "${pkgdir}/usr/share/${pkgname}/README"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
