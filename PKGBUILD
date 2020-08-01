# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=python-aiocron
pkgver=1.3
pkgrel=3
pkgdesc="Provide a decorator to run function at time"
arch=(any)
url="https://github.com/gawel/aiocron/"
license=('MIT')
depends=('python' 'python-tzlocal' 'python-croniter')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/aiocron/aiocron-$pkgver.tar.gz")
sha256sums=('7f7c343b5bb18695206714f038726e3795e6dfa69affcc25abe17838d51be69c')

build() {
    cd "$srcdir"/aiocron-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/aiocron-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
}
