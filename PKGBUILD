# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Mathijs Kadijk <maccain13@gmail.com>

pkgname=python-azkaban
pkgver=0.9.7
pkgrel=1
pkgdesc="Lightweight Azkaban client"
arch=('any')
url="https://github.com/mtth/azkaban"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/azkaban/azkaban-$pkgver.tar.gz")

package() {
    cd "$srcdir"/azkaban-$pkgver
    python setup.py install --root="$pkgdir" -O1
    chmod o+r "$pkgdir/usr/lib/python3.6/site-packages/azkaban-$pkgver-py3.6.egg-info/"*
    install -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('c31422fa3ef6849e2c1eba2f99f03056e6c90107a215838fbb0e487a82420f5f')
