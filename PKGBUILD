# Maintainer: ltdk <usr@ltdk.xyz>
pkgname=ai-robots-txt
pkgver=1.52
pkgrel=1
pkgdesc='List of AI crawler user agents.'
arch=(any)
url="https://github.com/ai-robots-txt/ai.robots.txt"
license=('MIT')
optdepends=('nginx: nginx blocker config'
            'haproxy: haproxy blocker config'
            'apache: htaccess blocker config'
            'caddy: caddy blocker config')
source=("https://github.com/ai-robots-txt/ai.robots.txt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f40a85239b6783ff0ca25d87c4d18624182fbce762afa4e2e100859a4acbb854')

package() {
  install -m644 -D "$srcdir/ai.robots.txt-$pkgver"/robots.txt -T "$pkgdir"/usr/share/ai-robots-txt/robots.txt
  install -m644 -D "$srcdir/ai.robots.txt-$pkgver"/robots.json -T "$pkgdir"/usr/share/ai-robots-txt/robots.json
  install -m644 -D "$srcdir/ai.robots.txt-$pkgver"/nginx-block-ai-bots.conf -T "$pkgdir"/usr/share/ai-robots-txt/nginx-block-ai-bots.conf
  install -m644 -D "$srcdir/ai.robots.txt-$pkgver"/haproxy-block-ai-bots.txt -T "$pkgdir"/usr/share/ai-robots-txt/haproxy-block-ai-bots.txt
  install -m644 -D "$srcdir/ai.robots.txt-$pkgver"/.htaccess -T "$pkgdir"/usr/share/ai-robots-txt/htaccess
  install -m644 -D "$srcdir/ai.robots.txt-$pkgver"/Caddyfile -T "$pkgdir"/usr/share/ai-robots-txt/Caddyfile
  install -m644 -D "$srcdir/ai.robots.txt-$pkgver"/LICENSE -T "$pkgdir"/usr/share/licenses/ai-robots-txt/LICENSE
}
