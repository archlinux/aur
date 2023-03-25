# Maintainer: Feresey <p.milko1999@yandex.ru>

pkgname=shellgpt-git
_pkgname=shell_gpt
pkgver=0.0.1
pkgrel=1
pkgdesc="A command-line productivity tool powered by OpenAI's ChatGPT (GPT-3.5)"
arch=('any')
url="https://github.com/sergeyleschev/shell_gpt"
license=('MIT')
provides=("${pkgname}")
makedepends=('git')
depends=(
    'python'
    'python-typer'
    'python-requests'
    'python-rich'
    'python-click'
    'python-distro'
    'python-setuptools'
    'python-importlib-metadata'
)
source=("git+https://github.com/sergeyleschev/shell_gpt.git")
sha256sums=('SKIP')

package() {
    cd ${srcdir}/${_pkgname}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python ./setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
