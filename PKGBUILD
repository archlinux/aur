# Maintainer: Javier Tia <javier dot tia at gmail dot com>

pkgname=z.lua
pkgver=1.5.4
pkgrel=1
pkgdesc='A new cd command that helps you navigate faster by learning your habits'
arch=('any')
url='https://github.com/skywind3000/z.lua'
license=('MIT')
depends=('lua')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
replaces=("${pkgname}-git")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f74ee3ad4d58fa00d4a712024b1f5f508a35eec63789ac21a36993b4bb1f9ecf')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # install -Dm 755 -t "${pkgdir}/usr/bin/" "${pkgname}"
  install -D -t "${pkgdir}/usr/share/${pkgname}/" \
    init.fish README.md test_path.lua z.cmd z.lua z.lua.plugin.zsh
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname%-*}/" LICENSE
}

# vim:set ts=2 sw=2 et:
