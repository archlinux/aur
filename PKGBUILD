# Maintainer: Aditya Hebballe <adityahebballe@proton.me>

pkgname=cosmic-audio-switch-git
_srcname=cosmic-audio-switch
pkgver=r1.g8635fa9
pkgrel=1
pkgdesc='Cycle selected PipeWire or PulseAudio outputs and show a COSMIC OSD'
arch=('any')
url='https://github.com/AdityaHebballe/cosmic-audio-switch'
license=('unknown')
depends=('bash' 'cosmic-external-osd-git' 'jq' 'libpulse' 'systemd')
makedepends=('git')
provides=('cosmic-audio-switch')
conflicts=('cosmic-audio-switch')
source=("${_srcname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_srcname}"
  printf 'r%s.g%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_srcname}"
  install -Dm755 audio-output-cycle "${pkgdir}/usr/bin/audio-output-cycle"
}
