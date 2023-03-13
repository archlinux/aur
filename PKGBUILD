# Maintainer: bgh <aur at bgh dot io>

pkgname=streamlink-handoff-host
pkgver=1.0.0
pkgrel=2
pkgdesc='Streamlink Handoff native messaging host configuration'
arch=('any')
url=https://github.com/bgh-github/streamlink-handoff
license=('GPL3')
depends=('xxd' 'firefox' 'streamlink')
optdepends=('vlc: streamlink default player' 'mpv: alternative player')
_github_source=https://raw.githubusercontent.com/bgh-github/streamlink-handoff/main/aur
source=("${_github_source}/streamlink_handoff_host.json" "${_github_source}/streamlink-handoff.sh")
sha256sums=('bc585daacb7a47bd19474906bf031ff411f13b96d4afd3896fa0935f1cd37fa6'
            '820ca317cdb2d520bc803d25cc208aa673005cf8b6389e13114323313ab2b199')

package() {
    local host_dir=/usr/lib/mozilla/native-messaging-hosts

    install --directory --verbose "${pkgdir}${host_dir}"
    install --mode=644 --verbose streamlink_handoff_host.json "${pkgdir}${host_dir}"
    install --mode=755 --verbose streamlink-handoff.sh "${pkgdir}${host_dir}"
}
