# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

# powershell and powershell-editor-services build against these libraries, built from source by their
# own packages, through powershell-build-deps, which this package or powershell-build-deps-bin
# (upstream's packages from nuget.org instead) provides. The packages of .NET itself are chosen by
# dotnet-build-deps-10.0 instead.
pkgname=powershell-build-deps
pkgver=1
pkgrel=1
pkgdesc="Libraries PowerShell and its editor services build against, built from source (meta package)"
arch=('any')
url='https://github.com/PowerShell/PowerShell'
license=('0BSD')
depends=(
  # powershell
  dotnet-azure-core
  dotnet-azure-identity
  dotnet-jsonschema-net-7
  dotnet-markdig
  dotnet-microsoft-identity-client
  dotnet-newtonsoft-json
  dotnet-powershellstandard-library
  dotnet-roslyn
  dotnet-system-clientmodel
  dotnet-system-data-sqlclient
  dotnet-wcf
  # The Gherkin parser of Pester 4, which the tests of powershell are written for
  dotnet-gherkin-5
  # powershell-editor-services
  dotnet-mediatr-12
  dotnet-nerdbank-streams
  dotnet-omnisharp-extensions
  dotnet-pluralize-net
  dotnet-system-reactive
  dotnet-vs-threading
  dotnet-vs-validation
)
source=("LICENSE")
sha512sums=('a33658d9271e5c537ccd41bf540b463ad2a5eca4a060c80486ff42a736f0aa042d10436e7177c34d792177cb11285243dee1f31c4df54fb0bfaabbc306406930')
b2sums=('a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
