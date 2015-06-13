# Maintainer: Muflone <webreg(at)vbsimple.net>
# Contributor: Jonathan Curran <joncfoo at gmail com>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>

pkgname=gnome-encfs-hg
pkgver=30
pkgrel=1
pkgdesc="GNOME Keyring integration for EncFS folders"
url="https://bitbucket.org/obensonne/gnome-encfs"
arch=('any')
license=('GPL3')
depends=('encfs' 'python2' 'python2-gnomekeyring' 'python2-xdg' 'python2-gnomekeyring')
makedepends=('mercurial')
source=("${pkgname%-*}"::"hg+https://bitbucket.org/obensonne/gnome-encfs")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  hg identify -n
}

prepare() {
  cd "${pkgname%-*}"
  sed -i -e "s|bin\/python|bin\/python2|" gnome-encfs
}

package() {
  cd "${pkgname%-*}"
  install -D -m755 gnome-encfs "${pkgdir}/usr/bin/${pkgname%-*}"
}
