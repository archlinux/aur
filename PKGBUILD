# Maintainer: ltdk <usr@ltdk.xyz>
pkgname=ai-robots-txt
pkgver=1.44
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
sha256sums=('67f14eef069e0fb261ce64215965b28331513512b94b2793bb09fd3e458a3b65')

package() {
  install -m644 -D "$srcdir"/ai.robots.txt/robots.txt -T "$pkgdir"/usr/share/ai-robots-txt/robots.txt
  install -m644 -D "$srcdir"/ai.robots.txt/robots.json -T "$pkgdir"/usr/share/ai-robots-txt/robots.json
  install -m644 -D "$srcdir"/ai.robots.txt/nginx-block-ai-bots.conf -T "$pkgdir"/usr/share/ai-robots-txt/nginx-block-ai-bots.conf
  install -m644 -D "$srcdir"/ai.robots.txt/haproxy-block-ai-bots.txt -T "$pkgdir"/usr/share/ai-robots-txt/haproxy-block-ai-bots.txt
  install -m644 -D "$srcdir"/ai.robots.txt/.htaccess -T "$pkgdir"/usr/share/ai-robots-txt/htaccess
  install -m644 -D "$srcdir"/ai.robots.txt/Caddyfile -T "$pkgdir"/usr/share/ai-robots-txt/Caddyfile
}
