# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname='teams-for-linux-bin'
pkgver=2.20.1
pkgrel=1
pkgdesc='Unofficial Microsoft Teams for Linux client (binary version)'
url='https://github.com/IsmaelMartinez/teams-for-linux'
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64' 'armv7h')
provides=('teams-for-linux')
conflicts=('teams-for-linux'
           'teams-for-linux-appimage'
           'teams-for-linux-git'
           'teams-for-linux-wbundled-electron'
          )
depends=('gtk3' 'libxss' 'nss' 'alsa-lib' 'nodejs')
source_x86_64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_amd64.deb")
source_aarch64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_arm64.deb")
source_armv7h=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_armv7l.deb")
b2sums_x86_64=('8b5f3828cd8f0cd3f716175ff71eb7630300582668d39e82a294798fae9873a643ded198dac9209763a8706274beb20623c4a54917a34579207ebb6d0ba8838f')
b2sums_aarch64=('8b320ab23c27f7430c8f943057b00d6867c5d5688888b66b6b124a3512ea621b26b53e111902328fe8dbb1c98fa8e694931cd0d4f737b4889af11deb973fe3b8')
b2sums_armv7h=('919a7fbedd5579a34ace8b7650fa22f6495e77f7b158dd505e67c059429e1d24abf03b98b043901f074945c927c8230185be48f3b91c0db45d5849d65df35301')
options=('!strip')

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
