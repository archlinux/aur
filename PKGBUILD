# Maintainer: Michael Morris <mmorri@users.noreply.github.com>

pkgname=samsung-galaxybook-audio
pkgver=0.1.0
pkgrel=2
pkgdesc='Samsung Galaxy Book Realtek ALC298 speaker amplifier initialization'
arch=('any')
url='https://github.com/mmorri/samsung-galaxybook-audio'
license=('MIT')
depends=('alsa-tools' 'systemd' 'wireplumber')
install="$pkgname.install"
source=(
  'samsung-galaxybook-audio-init'
  'samsung-galaxybook-audio.service'
  'samsung-galaxybook-audio-sleep'
  '51-samsung-galaxybook-audio.conf'
)
sha256sums=('c535979ebea898c47cfb373cfeb1b053ba056887fe6e1bf9ce139db1b8aa9c41'
            '3c690f91406a327f34bfc96d16c602eb4ed0c019ff5e87f8ff67686eb8a60658'
            'de67af51dfcc4647eed418f2c78f0ac84529f2cfb6ca3a4375ce8c2137ae6f3e'
            '27025834d56c4c94acacfa3568e9595ce6aa665bf25e145bdfbae213d490d7e2')

package() {
  install -Dm755 samsung-galaxybook-audio-init "$pkgdir/usr/bin/samsung-galaxybook-audio-init"
  install -Dm644 samsung-galaxybook-audio.service "$pkgdir/usr/lib/systemd/system/samsung-galaxybook-audio.service"
  install -Dm755 samsung-galaxybook-audio-sleep "$pkgdir/usr/lib/systemd/system-sleep/samsung-galaxybook-audio"
  install -Dm644 51-samsung-galaxybook-audio.conf "$pkgdir/usr/share/wireplumber/wireplumber.conf.d/51-samsung-galaxybook-audio.conf"
}
