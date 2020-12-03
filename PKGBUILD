# Maintainer: pumpkincheshire <sollyonzou@gmail.com>
# Contributor wicastC <wicastchen at hotmail dot com>

pkgname=python-lda
_name=lda
pkgver=2.0.0
pkgrel=2
pkgdesc="Topic modeling with latent Dirichlet allocation using Gibbs sampling"
arch=("i686" "x86_64")
url="https://github.com/lda-project/lda"
license=('custom:MPLv2')
depends=("python" "python-numpy" "python-pbr")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d8d7c0bc42208902a9e34261b76793a84f59e6c69cfd7ca12ce982cdaf7c3020')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    #  install -Dm644 $scrdir/README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}
