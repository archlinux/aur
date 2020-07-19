# Maintainer: alex4ip <alex4ip@gmail.com>

pkgname=porter-bin
pkgver=0.27.1
#PKG_PERMALINK=${PKG_PERMALINK:-latest}
pkgrel=1
epoch=1
pkgdesc='A utility to help make your application + etc (env/tool) as a versioned bundle that you can distribute, and then install with a single command'
arch=(x86_64)
url='https://github.com/deislabs/porter'
license=(MIT)
depends=('docker')
provides=('porter')
#makedepends=('go')
source=("$pkgname-$pkgver::https://cdn.porter.sh/v${pkgver}/porter-linux-amd64")
sha512sums=('d9d5a20d21164e4bb61a54fa4681689e50986915a50e54a07db81d805eff7a2163103a64da1557abc0b91730e77dcd13d3be0cc728d42d91a732c68df93e03f6')

package() {
  #cd "$srcdir"
  install -Dm 755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/$provides"

  # Add command completion
  # install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  # install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  # "$pkgdir/usr/bin/provides" completion bash > "$pkgdir/usr/share/bash-completion/completions/provides"
  # "$pkgdir/usr/bin/provides" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_provides"

PORTER_HOME=~/.porter
PKG_PERMALINK=${PKG_PERMALINK:-latest}

mkdir -p $PORTER_HOME

echo $PORTER_URL/$PORTER_PERMALINK/porter-linux-amd64

porter mixin install exec --version $PKG_PERMALINK
porter mixin install kubernetes --version $PKG_PERMALINKLINK
porter mixin install helm --version $PKG_PERMALINK
#porter mixin install arm --version $PKG_PERMALINK
porter mixin install terraform --version $PKG_PERMALINKINK
porter mixin install az --version $PKG_PERMALINK
porter mixin install aws --version $PKG_PERMALINK
porter mixin install gcloud --version $PKG_PERMALINK

porter plugin install azure --version $PKG_PERMALINK

# echo "Installation complete."
}

# vim:set ts=2 sw=2 et:
