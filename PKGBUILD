pkgname=sensuctl-bin
pkgver=6.4.3
pkgrel=1
provides=('sensuctl')
pkgdesc='Sensu CLI'
arch=('x86_64')
url='https://sensu.io'
license=('MIT')
sha256sums=('d27412efeeb77a462abaa19bcc14b531b156dd8d48b5a46b1a89a06929018254')
source=("https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")

package() {
  install -Dm 755 "${srcdir}/sensuctl" "${pkgdir}/usr/bin/sensuctl"

  # Populate bash and zsh completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm 755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/sensuctl" completion bash > "${pkgdir}/usr/share/bash-completion/completions/sensuctl"
  "${pkgdir}/usr/bin/sensuctl" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_sensuctl"
}
