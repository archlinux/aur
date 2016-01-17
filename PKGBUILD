# Maintainer: Sander Boom <sanderboom@gmail.com>

pkgname=git-smb
pkgver=1.3
pkgrel=1
pkgdesc="Play sounds effects (from Super Mario Bros (NES), Zelda (NES), Command & Conquer or Duke Nukem) on common git commands"
arch=('any')
url="https://github.com/pascaldevink/git-smb"
license=('MIT')
depends=('git')
source=("https://github.com/pascaldevink/git-smb/archive/${pkgver}.tar.gz")
install="git-smb.install"
noextract=("${pkgver}.tar.gz")
sha256sums=('eeb27475f0de2f3a8941a4da347040e8800a76d48f8ebc21395e0b033c8aa97d')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/opt/git-smb" 
  tar xf "${pkgver}.tar.gz" --exclude='.gitignore' --strip 1 -C "${pkgdir}/opt/git-smb"

  install -dm755 "${pkgdir}/usr/bin" 
  ln -sf "/opt/git-smb/bin/git-smb" "${pkgdir}/usr/bin/git-smb"
}
