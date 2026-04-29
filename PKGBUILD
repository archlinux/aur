# Maintainer: L. Bradley LaBoon <brad@laboon.io>
# Contributor: Tim Meusel <tim@bastelfreak.de>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Greg Sutcliffe <puppet-aur (at) emeraldreverie (dot) org>
# Contributor: Hyacinthe Cartiaux <hyacinthe (dot) cartiaux (at) free (dot) fr>
# Contributor: Thomas S Hatch <thatch45 (at) Gmail (dot) com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Miah Johnson <miah (at) chia-pet dot org>
# Contributor: Dave Simons <miouhpi (at) Gmail (dot) com>
# Contributor: Niels Abspoel <aboe76 (at) Gmail (dot) com>

pkgname=openvox
pkgver=8.26.2
pkgrel=1
pkgdesc='Server automation framework and application'
arch=('any')
url='https://github.com/OpenVoxProject'
license=('Apache-2.0')
depends=(
  openfact
  ruby
  ruby-augeas
  ruby-concurrent
  ruby-deep_merge
  ruby-erb
  ruby-fast_gettext
  ruby-locale
  ruby-multi_json
  ruby-puppet-resource_api
  ruby-racc
  ruby-scanf
  ruby-semantic_puppet
  ruby-getoptlong
  ruby-syslog
  ruby-shadow
)
makedepends=(
  git
  ruby-rdoc
)
# checkdepends=(
#   procps-ng
#   ruby-ffi
#   ruby-hocon
#   ruby-json-schema
#   ruby-rake
#   ruby-rspec
#   ruby-rspec-its
#   ruby-vcr
#   ruby-webmock
#   ruby-yard
# )
backup=('etc/puppetlabs/puppet/puppet.conf' 'etc/puppetlabs/puppet/hiera.yaml')
install="$pkgname.install"

_augeas_tag=v1.5.0
_cron_tag=v1.3.0
_host_tag=v1.3.0
_mount_tag=v1.3.0
_scheduled_task_tag=v3.2.0
_selinux_tag=v1.4.0
_sshkeys_tag=v2.5.0
_yumrepo_tag=v2.1.0
_zfs_tag=v1.6.1
_zone_tag=v1.2.0

source=("${pkgname}-${pkgver}::git+https://github.com/OpenVoxProject/openvox#tag=${pkgver}"
        "augeas_core::git+https://github.com/OpenVoxProject/puppetlabs-augeas_core#tag=${_augeas_tag}"
        "cron_core::git+https://github.com/OpenVoxProject/puppetlabs-cron_core#tag=${_cron_tag}"
        "host_core::git+https://github.com/OpenVoxProject/puppetlabs-host_core#tag=${_host_tag}"
        "mount_core::git+https://github.com/OpenVoxProject/puppetlabs-mount_core#tag=${_mount_tag}"
        "scheduled_task::git+https://github.com/OpenVoxProject/puppetlabs-scheduled_task#tag=${_scheduled_task_tag}"
        "selinux_core::git+https://github.com/OpenVoxProject/puppetlabs-selinux_core#tag=${_selinux_tag}"
        "sshkeys_core::git+https://github.com/OpenVoxProject/puppetlabs-sshkeys_core#tag=${_sshkeys_tag}"
        "yumrepo_core::git+https://github.com/OpenVoxProject/puppetlabs-yumrepo_core#tag=${_yumrepo_tag}"
        "zfs_core::git+https://github.com/OpenVoxProject/puppetlabs-zfs_core#tag=${_zfs_tag}"
        "zone_core::git+https://github.com/OpenVoxProject/puppetlabs-zone_core#tag=${_zone_tag}"
        )
sha512sums=('44a648157e5a7614747b966493fb967be23a02f6eb7d53b9b882bec1283a3ff332a5498fa25548acd9a31c0d027c2116351ee81f64827e7b3470ca81d5fd46e8'
            '6ebc4603db2e702623070f1703d3e82a25c689b8c149c3328660ab43d74bfa49c5853aa14d267b48c9f91d12bd4a96579bcf3184f8881a57748763484892bf90'
            '584093f64216becfeeb45514c9308c7df6819b39b93489790656f6e206c52abb7ed7077a9630c3f0aa2a6b9a6e57502f84cb1a862c03df325f2d97772773c4ce'
            '2bcb93ea1d9d6312205aa1975b1e233414d7bd9c713fb2e59a04f2f3ca436b89dde5b3070b3899fc0a3b5259866c6f3039c06517041d56d73dba08926e7afbec'
            '46e23741f1fcc141fcea45b07da95588eed14762b7f96794447d7f00f8f5e83750f6d23f9d9a80797e711783d30f79375578d91f4ea146d12ca2dee396073593'
            '4ac414d246116539ca029b86d2ab8f54f9e475cc7d36f96ed609845a3b4e9d9d9e390233b41a3dc3842d0aae979e47bab28c98025ac2d747b2d581e4131912af'
            'f3a2b4f1b40ab78ff8c8772be1b94b4a41465dfdad7e44c4cc4158d5852cca732ea7ca08c8d795c97eabc40c43e8145a509ea3aeced99485e6066b2f64555d68'
            '9d458354a95206b998a148bf9b459c8a792051ddaf03672f0ea4c161721ac405c00523ecc065e6acfa610cb9b61e7940a1611b08bb2395c8d3d5a620c6c3662a'
            '6203781a13142747827ee658db3e428ed97732abf356f88224a7f780bfa046ddafcdd69f1e551b3dbe1ad5b00d9a78248a1ba7e97c58fbac636500a95c5e3b7e'
            'cf73509b4b66f307bfe5027814ec7b26173773f568f3b98286b8d1b8334b3f539f62151ac8fb7036be44b84e9d20c1805cd86177ffe1ab0924ed53407e4538ab'
            '47fafc95cc9aba258cfd8919707366072a50f8a99b59f540c2531e1a367e8c9230070f8b9e7ae5c9ed4f536e05116234ed02ea431b6e48f61c82ce6dd92ebd9b')
conflicts=('puppet' 'puppet5' 'puppet6' 'hiera')
provides=("puppet=${pkgver%%.*}")
replaces=('hiera')

prepare() {
  cd "${pkgname}-${pkgver}"

  # FS#45044: fix file location
  sed -i 's_/opt/puppetlabs/puppet_/usr_' ext/systemd/puppet.service

  # Fix version.rb lib loading issue
  ruby_version=$( ruby -e 'puts RbConfig::CONFIG["ruby_version"]' )
  sed -i "s:/vendor_ruby/puppet:/vendor_ruby/${ruby_version}/puppet:" openvox.gemspec
}

# check() {
#   cd "${pkgname}-${pkgver}"
#
#   rake spec
# }

package() {
  cd "${pkgname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  # install the gemspec file
  # this allows other gems to load puppet as a library (for example puppet-strings)
  install -Dm644 openvox.gemspec "${pkgdir}/${_gemdir}/specifications/puppet-${pkgver}.gemspec"

  # generate manpages | this breaks right now..
  #rake gen_manpages

  ruby install.rb --destdir="$pkgdir" --sitelibdir="$( ruby -e 'puts RbConfig::CONFIG["vendorlibdir"]' )"

  install -d "$pkgdir"/usr/lib/{sysusers.d,tmpfiles.d}

  echo 'u puppet 52 "Puppet" /var/lib/puppet' > "$pkgdir"/usr/lib/sysusers.d/puppet.conf
  echo "d /run/puppetlabs 0755 puppet puppet -" > "$pkgdir"/usr/lib/tmpfiles.d/puppet.conf

  # systemd
  install -Dm644 "${srcdir}/$pkgname-${pkgver}/ext/systemd/puppet.service" "${pkgdir}/usr/lib/systemd/system/puppet.service"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # Match permissions that puppet sets when running
  install -dm775 "$pkgdir"/var/lib/puppet
  chmod 750 "$pkgdir"/var/log/puppetlabs/puppet

  rm -r "$pkgdir"/var/run

  cd ..
  install --directory "${pkgdir}/opt/puppetlabs/puppet/vendor_modules/"
  mv *_core scheduled_task "${pkgdir}/opt/puppetlabs/puppet/vendor_modules/"
  # Search for unwanted directories and files and delete them
  find "${pkgdir}/opt/puppetlabs/puppet/vendor_modules/" -type d \( -name .git -o -name spec -o -name rakelib \) -exec rm -rf {} +
  find "${pkgdir}/opt/puppetlabs/puppet/vendor_modules/" -name '.*' -exec rm -rf {} +
  find "${pkgdir}/opt/puppetlabs/puppet/vendor_modules/" -type f \( -name pdk.yaml -o -name appveyor.yml -o -name Rakefile -o -name Gemfile \) -delete
}
