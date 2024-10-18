# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-code2flow"
_name="code2flow"
pkgver=2.5.1
pkgrel=1
pkgdesc="Visualize your source code as DOT flowcharts"
url="https://github.com/scottrogowski/code2flow"
license=("MIT")
arch=("any")
depends=("python" "graphviz")
optdepends=("acorn: javascript support"
            "ruby-parser: ruby support")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('18ee26a04ee1846901ef922fa4493e90cef4d134948c0642a8e3727369a8db9b6041d97eafdf57c08bb1c977f87e5435ba19591e8c80cf21aaa1b01194f8f418')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
