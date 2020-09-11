# Maintainer: Kevin Andriessens <kevin@kelaun.be>
pkgname='instawow'
pkgver='1.14.1'
pkgrel=1
pkgdesc="Package manager for World of Warcraft"
arch=('x86_64')
url="https://github.com/layday/instawow"
license=('GPL')
depends=('python>=3.7.0')
makedepends=('tar' 'python-aiohttp>=3.5.0' 'python-alembic>=1.4.0' 'python-click>=7.1.0' 'python-jellyfish>=0.8.2' 'python-jinja-time' 'python-loguru<1.0.0' 'python-prompt_toolkit>3.0.2' 'python-prompt_toolkit<4.0.0' 'python-pydantic>=1.6.1' 'python-questionary>1.3.0' 'python-sqlalchemy>=1.3.19' 'python-typing_extensions>=3.7.0' 'python-yarl>=1.4.0' 'python-setuptools' 'python-slpp-git' 'python-slpp-git')
optdepends=('python-toml: test support'
	    'python-pytest: test support'
	    'python-pytest-asyncio: test support'
	    'python-aresponses: test support'
            'python-aiohttp_rpc: server support')
source=("$pkgname-v$pkgver.tar.gz::https://files.pythonhosted.org/packages/c6/b4/a8cd9b412010341cfb70577b21e598fcd12709e818142af4789b2e1a7466/$pkgname-$pkgver.tar.gz")
sha256sums=('d042c7fe3c1de9e1bb30a3f9dc88363001865e66933f1529519bc0b36aa53c27')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
