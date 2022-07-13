# Maintainer: alex4ip <alex4ip@gmail.com>
# Contiributer: Alex Ellis <alex@openfaas.com>

pkgname=k3sup-bin
_pkgname=k3sup
pkgver=0.12.0
pkgrel=1
epoch=1
pkgdesc='k3sup is a light-weight utility to get from zero to KUBECONFIG with k3s on any local or remote VM.'
arch=(x86_64)
url='https://github.com/alexellis/k3sup/'
license=(MIT)
depends=('openssh')
optdepends=('k3s'
            'kubernetes-bin'
            'helm'
            'terraform'
            'azure-cli: Command-line tools for Azure'
            'aws-cli: cli for Amazon Web Services'
            'google-cloud-sdk: gcloud - command-line tools for the Google Cloud Platform')
provides=('k3sup')
_OWNER=alexellis
_suffix=""
source=("$pkgname-$pkgver::https://github.com/${_OWNER}/${_pkgname}/releases/download/${pkgver}/${provides}${_suffix}")
sha256sums=('e99ef7fa624bb33f8d9bc4cfad4bfa0c891ca78d909bb6e81bcd8ba53dd50f47')

package() {  
  install -Dm 755 "$srcdir/$pkgname-$pkgver" "${pkgdir}/usr/bin/${provides}"
  # install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  # install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  # "$pkgdir/usr/bin/provides" completion bash > "$pkgdir/usr/share/bash-completion/completions/provides"
  # "$pkgdir/usr/bin/provides" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_provides"
}

# vim:set ts=2 sw=2 et:
