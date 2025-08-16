# Maintainer: bgh <aur at bgh dot io>

pkgname=streamlink-handoff-host
pkgver=1.0.0
pkgrel=3
pkgdesc='Streamlink Handoff native messaging host configuration'
arch=('any')
url=https://github.com/bgh-github/streamlink-handoff
license=('GPL-3.0-or-later')
depends=('firefox' 'streamlink')
optdepends=('vlc: streamlink default player' 'mpv: alternative player')
_github_source=https://raw.githubusercontent.com/bgh-github/streamlink-handoff/main/aur
source=("${_github_source}/streamlink_handoff_host.json" "${_github_source}/streamlink-handoff.sh")
b2sums=('94ab1a96941228e782134dfd5b43454ea5abfcc8b2934015df458380f3649c1813dad46922bf2f5e3c033fea39cf4b472716aa85873aaedc31bf6b5cfc7b7cd4'
        '70b0fb0dbe9adf5d81931a423e1e59af77f0b9ea2b0ac56e743b8f6e302e2c68d9b5af9a142f60b168c794bac6ef7dfaba80d9f944c9f99e7877a3da396461b0')

package() {
    local _host_dir=/usr/lib/mozilla/native-messaging-hosts

    install -D --mode=644 --target-directory="${pkgdir}${_host_dir}" streamlink_handoff_host.json
    install streamlink-handoff.sh "${pkgdir}${_host_dir}"
}
