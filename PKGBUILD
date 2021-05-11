
# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Luis Braun <luis.braun07@gmail.com>
pkgname=qtile-config-git
_pkgname=qtile-config-git
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="qtile config"
arch=(x86_64)
url="https://github.com/luis-07/qtile-config"
license=('GPL')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(qtile-config)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()



package() {
    cd ${_pkgname}
    sudo rm /usr/bin/qtile-config
    install -Dm755 qtile-config.py "${pkgdir}"/usr/bin/qtile-config


  rm -rf "${pkgdir}/opt/${pkgname}/qtile-config"
  mkdir -p "${pkgdir}/opt/${pkgname}/qtile-config"



  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.org "${pkgdir}/usr/share/doc/${pkgname}/README.org"
  install -Dm755 colorscript.sh "${pkgdir}"/usr/bin/qtile-config
  install -Dm644 zsh_completion/_colorscript -t "${pkgdir}"/usr/share/zsh/site-functions

}
