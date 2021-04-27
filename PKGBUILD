# Maintainer: Derek Taylor (DistroTube) <derek@distrotube.com>
pkgname=dmscripts-git
_pkgname=dmscripts
pkgver=1.0.r156.f7f5309
pkgrel=1
pkgdesc="A collection of dmenu scripts"
arch=('any')
url="https://gitlab.com/dwt1/dmscripts.git"
license=('GPL3')
depends=(dmenu xclip findutils zenity xdotool xorg-xrandr )
groups=()
makedepends=()
checkdepends=()
optdepends=(
  'emacs: editor for dmconf '
  'slock: used by dmlogout'
  'libnotify: used by dmlogout'
  'qutebrowser: used by dmqute'
  'reddio: used by dmred'
  )
provides=(dmscripts)
conflicts=(dmscripts)
replaces=()
backup=()
options=()
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd ${_pkgname}
  # Make sure to install all scripts
  for script in $(echo scripts/*); do 
    install -Dm755 ${script} -t "${pkgdir}/usr/bin"
  done
}

