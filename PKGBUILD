# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=python-sphinx-substitution-extensions
pkgver=2024.02.25
pkgrel=1
pkgdesc='Extensions for Sphinx which allow for substitutions'
arch=('any')
url='https://github.com/adamtheturtle/sphinx-substitution-extensions'
license=('APACHE')
depends=('python-sphinx')
makedepends=('python-setuptools' 'python-pip')
source=("https://github.com/adamtheturtle/sphinx-substitution-extensions/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('678dce24e835f3fdbfce578ca644ffda248334cef3bbea84b9a3ccde78ec6b0bb5ba8ceb145abbf05346bb448bbad729060b314ed8b141f383efed7db7890732')

build() {
    cd $srcdir/sphinx-substitution-extensions-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd $srcdir/sphinx-substitution-extensions-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
