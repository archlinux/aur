# Maintainer: badluma <tarmac_quarrel_7f@icloud.com>
pkgname=comprobot
pkgver=2.5.0
pkgrel=1
pkgdesc="A self-hostable Discord bot built for maximum customization."
arch=('any')
url="https://github.com/badluma/Comprobot"
license=('MIT')
depends=('python' 'python-pip')
makedepends=('python-build' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/c/comprobot/comprobot-${pkgver}.tar.gz")
sha256sums=('079c9de18c8dab9e2231b09948f8be12b814eb318ec9547e76d5c163da98e334')

build() {
    cd "comprobot-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "comprobot-${pkgver}"
    pip install --root="$pkgdir" --prefix=/usr --no-deps dist/*.whl
    pip install --root="$pkgdir" --prefix=/usr discord.py[voice] python-dotenv requests tomlkit appdirs ollama httpx InquirerPy
}
