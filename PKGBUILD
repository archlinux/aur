# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=yojenkins
pkgver=0.0.86
pkgrel=1
pkgdesc="A CLI tool to interface with Jenkins"
arch=('any')
url="https://www.yojenkins.com/"
license=('GPL3')
makedepends=('python-setuptools')  # unless it only requires distutils
depends=(
    'bash'
    'python'
    'python-click'
    'python-click-help-colors'
    'python-coloredlogs'
    'python-docker'
    'python-json2xml'
    'python-python-jenkins'
    'python-requests'
    'python-requests-futures'
    'python-simpleaudio'
    'python-toml'
    'python-urllib3'
    'python-xmltodict'
    'python-yaml'
    'python-yaspin'
    )
_wheel=${pkgname//-/_}-$pkgver-py3-none-any.whl
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
sha512sums=('6cc4f817e15dfc738f15d36975f2fcaad7d64b75cb1499062da6f52d36bc0aaaa4cbe496f4ae129f87dfab4ab06bc82d9848f062df2366ce313fdd0ef1bd0517')

makedepends=(python-installer python-wheel)

package() {
    python -m installer --destdir="$pkgdir" $_wheel
}
