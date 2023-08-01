# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=linkding-cli
_name=${pkgname//-/_}
pkgver=2022.11.0
pkgrel=1
pkgdesc="A CLI to interact with a linkding instance"
arch=('any')
url="https://github.com/bachya/linkding-cli"
license=('MIT')
depends=('python-importlib-metadata' 'python-typer' 'python-ruamel-yaml' 'python' 'python-aiolinkding'
'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=(06ed748ff675004632146566d6ea7c555bcb0b4639dea5c55c697bff8996f22d9904d125d4c03b924810f686173cffb873f9389a647c224257862193ab4c0f8c)

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
