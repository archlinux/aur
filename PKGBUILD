# Maintainer: ltdk <usr@ltdk.xyz>
pkgname=ai-robots-txt
pkgver=1.45
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
sha256sums=('b4ffb58dbd89c0f1affa3ce20f3db679517c8bd4b59a5c3c06a4d2f62932dd37')

package() {
  install -m644 -D "$srcdir"/ai.robots.txt/robots.txt -T "$pkgdir"/usr/share/ai-robots-txt/robots.txt
  install -m644 -D "$srcdir"/ai.robots.txt/robots.json -T "$pkgdir"/usr/share/ai-robots-txt/robots.json
  install -m644 -D "$srcdir"/ai.robots.txt/nginx-block-ai-bots.conf -T "$pkgdir"/usr/share/ai-robots-txt/nginx-block-ai-bots.conf
  install -m644 -D "$srcdir"/ai.robots.txt/haproxy-block-ai-bots.txt -T "$pkgdir"/usr/share/ai-robots-txt/haproxy-block-ai-bots.txt
  install -m644 -D "$srcdir"/ai.robots.txt/.htaccess -T "$pkgdir"/usr/share/ai-robots-txt/htaccess
  install -m644 -D "$srcdir"/ai.robots.txt/Caddyfile -T "$pkgdir"/usr/share/ai-robots-txt/Caddyfile
  install -m644 -D "$srcdir"/ai.robots.txt/LICENSE -T "$pkgdir"/usr/share/licenses/ai.robots.txt/LICENSE
}
