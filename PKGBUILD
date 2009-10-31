# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Hugo Doria <hugodoria at gmail.com>

pkgname=translate-toolkit
pkgver=2.2.4
pkgrel=1
pkgdesc="A toolkit to convert between various different translation formats, help process and validate localisations"
arch=('any')
url="http://toolkit.translatehouse.org/"
license=('GPL')
depends=('bash' 'python-lxml' 'python-six')
makedepends=('python-setuptools')
optdepends=('python-iniparse: for ini2po'
            'gaupol: for po2sub')
source=("https://github.com/translate/translate/releases/download/$pkgver/${pkgname}-${pkgver}.tar.gz")
md5sums=('4ff21c47bf16e0855b913246ae397a58')

package() {
  cd "${pkgname}-${pkgver}"

  python -s setup.py install --root="${pkgdir}" --optimize=1
  python -m compileall "${pkgdir}"/usr/lib/python3.6/site-packages/translate
}
