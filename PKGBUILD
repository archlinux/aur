# Maintainer: robertfoster
pkgname=mimic
_pkgname=mimic3
pkgver=0.2.4
pkgrel=2
pkgdesc="Text-to-speech voice synthesis from the Mycroft project."
arch=(x86_64 i686)
url="https://mimic.mycroft.ai/"
license=('AGPL3')
depends=('python' 'python-dataclasses-json' 'python-epitran' 'python-gruut-ipa' 'python-phonemes2ids' 'python-xdgenvpy')
makedepends=('python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MycroftAI/${_pkgname}/archive/refs/tags/release/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${_pkgname}-release-v${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-release-v${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('6c14e2453a4ee533864fb2b586110c912b3ceb383589265cce1b37fc82e48923')
