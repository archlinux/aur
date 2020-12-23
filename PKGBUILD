# Maintainer: Térence Clastres <t dot clastres at gmail dot com>

pkgname=jack-audio-tools
pkgver=0.3.2
pkgrel=1
pkgdesc="A collection of utilities and tools for the JACK audio ecosystem. Git version."
arch=('any')
url="https://github.com/SpotlightKid/jack-audio-tools"
license=('MIT')
makedepends=('python-setuptools')
depends=('lilv' 'python-rdflib')
optdepends=('jack: for  JACK Transport scripts'
            'lv2: for LV2 scripts'
            'carla: for carxp2lv2presets script'
            )
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('288de54dd783d4f37ebe754910166318f7efe9ac90ce2e41564ff366236526ec')

build() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
