# Maintainer: alex4ip <alex4ip@gmail.com>

pkgname=porter-bin
pkgver=0.27.1
#PKG_PERMALINK=${PKG_PERMALINK:-latest}
pkgrel=1
epoch=1
pkgdesc='A utility to help make your application + etc (env/tool) as a versioned bundle that you can distribute, and then install with a single command'
arch=(i686 x86_64)
url='https://github.com/deislabs/porter'
license=(MIT)
depends=('docker')
provides=('porter')
#makedepends=('go')
source=("$pkgname-$pkgver::https://cdn.porter.sh/v${pkgver}/porter-linux-amd64")
sha512sums=('SKIP')

package() {
  #cd "$srcdir"
  install -Dm 755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/$provides"

  # Add command completion
  # install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  # install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  # "$pkgdir/usr/bin/provides" completion bash > "$pkgdir/usr/share/bash-completion/completions/provides"
  # "$pkgdir/usr/bin/provides" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_provides"

# set -euo pipefail

PORTER_HOME=~/.porter
PKG_PERMALINK=${PKG_PERMALINK:-latest}

mkdir -p $PORTER_HOME

echo $PORTER_URL/$PORTER_PERMALINK/porter-linux-amd64

$PORTER_HOME/porter mixin install exec --version $PKG_PERMALINK
$PORTER_HOME/porter mixin install kubernetes --version $PKG_PERMALINKLINK
$PORTER_HOME/porter mixin install helm --version $PKG_PERMALINK
#$PORTER_HOME/porter mixin install arm --version $PKG_PERMALINK
$PORTER_HOME/porter mixin install terraform --version $PKG_PERMALINKINK
$PORTER_HOME/porter mixin install az --version $PKG_PERMALINK
$PORTER_HOME/porter mixin install aws --version $PKG_PERMALINK
$PORTER_HOME/porter mixin install gcloud --version $PKG_PERMALINK

$PORTER_HOME/porter plugin install azure --version $PKG_PERMALINK

# echo "Installation complete."

}

# vim:set ts=2 sw=2 et: