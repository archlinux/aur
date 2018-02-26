# Maintainer: Eray Aydın <eray@labkod.com>
# Contributor: Burak Kanber <burak@burakkanber.com>
# Contributor: Vegar Andreas Bergum <vegar.andreas@gmail.com>
# Contributor: Tom Sullivan <github.com/msbit>
# Contributor: Adnan Hajdarević <github.com/adnanh>

_npmname=slackadaisical
pkgname=slackadaisical
pkgver=0.1.2
pkgrel=2
pkgdesc="Command line slack chat client"
arch=('any')
url="https://github.com/bkanber/Slackadaisical"
license=('GPL-3.0')
depends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('fe58b55fca2ea519d143b3f9eb6a78a99e2c4c1090770665a6a205ddbd80de06')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --no-optional --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  msg "Write your Slack API User Token to ~/.slack_token."
  msg "You can generate your user token with visiting https://api.slack.com/custom-integrations/legacy-tokens"
  msg "echo 'YOUR_SLACK_API_USER_TOKEN' | tee ~/.slack_token"
}
