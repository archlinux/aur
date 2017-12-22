# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=vapoursynth-editor
pkgver=R18
pkgrel=1
pkgdesc='VapourSynth script editor'
arch=('x86_64')
url='https://bitbucket.org/mystery_keeper/vapoursynth-editor'
license=('CCPL' 'MIT')
depends=('qt5-base' 'qt5-websockets' 'vapoursynth')
makedepends=('git')
source=("git+https://bitbucket.org/mystery_keeper/vapoursynth-editor.git#tag=${pkgver,}"
        'vsedit.desktop')
sha256sums=('SKIP'
            'b6d24441cf5746ea4dc08ecf379c67695bac663deb394db4334ba6aba9474c0f')

build() {
  cd vapoursynth-editor/pro

  qmake-qt5
  make
}

package() {
  cd vapoursynth-editor/build/release-64bit-gcc

  install -Dm 755 vsedit -t "${pkgdir}"/usr/bin/
  install -Dm 644 vsedit.svg -t "${pkgdir}"/usr/share/pixmaps/
  install -Dm 644 ../../../vsedit.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/vapoursynth-editor/
}

# vim: ts=2 sw=2 et:
