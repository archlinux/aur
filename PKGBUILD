# Maintainer: badluma <tarmac_quarrel_7f@icloud.com>
pkgname=comprobot
pkgver=2.3.3
pkgrel=1
pkgdesc="A self-hostable Discord bot built for maximum customization."
arch=('any')
url="https://github.com/badluma/Comprobot"
license=('MIT')
depends=('python' 'python-pip')
makedepends=('python-build' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/c/comprobot/comprobot-${pkgver}.tar.gz")
sha256sums=('d2a1502dd1e0e231ce2f0c20d50ce4ccaa46f168aaef5fcb4f6d1537342be493')

build() {
    cd "comprobot-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "comprobot-${pkgver}"
    pip install --root="$pkgdir" --prefix=/usr --no-deps dist/*.whl
    pip install --root="$pkgdir" --prefix=/usr discord.py[voice] python-dotenv requests tomlkit appdirs ollama httpx InquirerPy
}
