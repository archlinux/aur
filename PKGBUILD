# Maintainer: Steve Engledow <steve@engledow.me>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=progress-quest-bin
pkgver=6.4.4
pkgrel=1
pkgdesc='Progress Quest is an antic and fantastical computer role-playing game'
arch=('i686' 'x86_64')
url='http://progressquest.com/'
license=('MIT')
depends=('wine')
provides=('progress-quest')
source=(
    'http://www.progressquest.com/dl/pq6-4-4.zip'
)
sha256sums=('0c6982f6e9a4270968dfdec2874dc642957bddbdd55f4517fa013692ffe8e67e')

package() {
  install -Dm755 "pq.exe" "${pkgdir}/usr/share/progress-quest/pq.exe"
  cat > "progress-quest" << EOF
#!/bin/sh
CONFIG_DIR="${XDG_CONFIG_HOME:-${HOME}/.config}/.progress-quest"
mkdir -p "${CONFIG_DIR}"
cd "${CONFIG_DIR}"
wine /usr/share/progress-quest/pq.exe
EOF
  install -Dm755 "progress-quest" "${pkgdir}/usr/bin/progress-quest"
}
