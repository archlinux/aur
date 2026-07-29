# Maintainer: 9M2PJU <9M2PJU@users.noreply.github.com>
# Contributor: 9M2PJU <9M2PJU@users.noreply.github.com>
#
# Binary package: installs the upstream ytsurf shell script directly from
# the tagged GitHub release, so no source build step is needed.
#
# ytsurf is a pure bash script (no compilation), so this -bin package just
# ships the released script verbatim together with its runtime deps.
#
# All credit for ytsurf goes to Stanley Mwendwa (Stan-breaks).
# Original project: https://github.com/Stan-breaks/ytsurf

pkgname=ytsurf-9m2pju-bin
pkgver=3.1.8
pkgrel=1
pkgdesc="YouTube in your terminal. Clean and distraction-free. (binary release)"
arch=('any')
url="https://github.com/Stan-breaks/ytsurf"
license=('GPL-3.0-or-later')
depends=('bash' 'yt-dlp' 'jq' 'curl' 'mpv' 'fzf' 'chafa' 'ffmpeg' 'perl' 'socat')
optdepends=(
  'rofi: GUI launcher alternative to fzf'
  'sentaku: A minimalist selecter alternative'
)
provides=('ytsurf')
conflicts=('ytsurf' 'ytsurf-git')
options=('!strip' '!debug')

source=("${pkgname}-${pkgver}.sh::${url}/raw/refs/tags/v${pkgver}/ytsurf.sh")
sha256sums=('211c93d2bed4e96de217b634ecf6a261aa0a2836bd9044fb3046f04ffcf6bb0e')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/ytsurf"
}
