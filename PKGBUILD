# Maintainer: Excalibur <saberconer at gmail dot com>

pkgname=python-aiot-bootrom-git
pkgver=1.1.4
pkgrel=1
pkgdesc='AIoT tool to bootstrap the flashing on MediaTek AIoT SoCs'
url='https://gitlab.com/mediatek/aiot/bsp/aiot-bootrom'
arch=('any')
license=('MIT')
depends=(
    'python'
)
makedepends=('python-setuptools')
provides=('python-aiot-bootrom')
conflicts=('python-aiot-bootrom')
source=("${pkgname}::git+https://gitlab.com/mediatek/aiot/bsp/aiot-bootrom.git")
md5sums=(SKIP)

build() {
	cd "${pkgname}"
	python setup.py build
}

package() {
	cd "${pkgname}"
	python setup.py install --root="${pkgdir}" --optimize=1

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
