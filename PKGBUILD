# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
#pls note, this is a binary package.
pkgname=armitage
pkgver=08.13.15
pkgrel=1
pkgdesc="A graphical cyber attack management tool for Metasploit"
url="http://www.fastandeasyhacking.com/"
arch=('any')
license=('GPL')
depends=('metasploit' 'java-environment')
makedepends=('apache-ant' 'zip' 'unzip' 'subversion')
provides=('armitage')
install='armitage.install'

source=( 'http://www.fastandeasyhacking.com/download/armitage150813.tgz'
         'armitage.install' 'armitage.desktop' 'metasploit.png' 'metasploit.sh')

sha256sums=('288065a8b779b6a4f4acaa0332f2ebbfd022529f600e4bf70cd494d84860f6ac'
             '47fbc185bf1fff347eb8ce7a1c2ea239192eea10800f1e4bc80af409a51b2f6d'
             '02c829495ebfb171146e2b02f1c2470f814c41b6c80f0649f59ac62609d18689'
             '7d25e47bbd5cd710020c30fb645229a774672c7bcb451a0cf2fd6ba327d8b141'
             '7869413529c5529b9a0f2bcaaa2be1480382c2f91eb505e43a4f9e1c1eab2d71')

package() {
  cd ${srcdir}
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -ra "${pkgname}/" "${pkgdir}/opt/"
  install -Dm644 "${srcdir}/armitage.desktop" "${pkgdir}/usr/share/applications/armigate.desktop"
  install -Dm644 "${srcdir}/metasploit.png" "${pkgdir}/usr/share/icons/metasploit.png"
  install -Dm755 "${srcdir}/metasploit.sh" "${pkgdir}/etc/profile.d/metasploit.sh"
}

# vim:set ts=2 sw=2 et:

