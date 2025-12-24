  pkgname=tempesta-bin
  pkgver=0.1.12
  pkgrel=1
  pkgdesc="The fastest and lightest bookmark manager CLI written in Rust (binary package)"
  arch=('x86_64' 'aarch64')
  url="https://github.com/x71c9/tempesta"
  license=('MIT')
  depends=('glibc')
  provides=('tempesta')
  conflicts=('tempesta')

  _baseurl="https://github.com/x71c9/tempesta/releases/download/v$pkgver"
  source_x86_64=("$_baseurl/tempesta-x86_64-unknown-linux-gnu.tar.gz")
  source_aarch64=("$_baseurl/tempesta-aarch64-unknown-linux-gnu.tar.gz")

  sha256sums_x86_64=('49ed17e0bd0b094f4b4802fa5870926cbdbd7ab37b729c381b83d0d73096786c')
  sha256sums_aarch64=('061344dd6896c3fabda6d80a022a5c18f8fea4f6b9a693e3652c156716ec8fe9')

  package() {
    if [[ $CARCH == "x86_64" ]]; then
      tar -xzf "tempesta-x86_64-unknown-linux-gnu.tar.gz"
    elif [[ $CARCH == "aarch64" ]]; then
      tar -xzf "tempesta-aarch64-unknown-linux-gnu.tar.gz"
    fi
    install -Dm755 tempesta "$pkgdir/usr/bin/tempesta"
  }
