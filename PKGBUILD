# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=18.2.4
pkgrel=3
pkgdesc='Distributed, fault-tolerant storage platform delivering object, block, and file system'
arch=('x86_64')
url='https://ceph.com/'
license=('GPL-2.0-or-later OR LGPL-2.1-or-later OR LGPL-3.0-or-later')
options=('emptydirs')
_artifact=v${pkgver}-${pkgrel}
_ceph_libs_packages=(
  ceph_{common,compressor,crypto,erasure}
  lib{rados,cephfs,rbd,rgw,cephsqlite}
  python_{ceph_common,rados,rbd,cephfs,rgw}
)
_ceph_packages=(
  ceph_{tools,test,volume}
  ceph_{rados,base,mon,mgr,osd,mds,rbd,cephfs,rgw,node_proxy}
  cephfs_{top,shell}
)
source=(
  $(
    printf '%s\n' "${_ceph_libs_packages[@]}" "${_ceph_packages[@]}" \
    | xargs -I@ printf '%s::%s ' \
      "@_${pkgver}_${pkgrel}.tar.zst" \
      "https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/@_linux_${arch}.tar.zstd" \
  )
)
sha512sums=('ea330a05e2da4550ce46fe3cae865902069c15432e5415fe1e38a1497bffae5494e50160dd40beb5e0d397e9c4ef6861f0e2d2a76a5237770a5ac8cc792b6417'
            '6c5a3052ff0da10187dfc4359dc7eaeb6be5068450459c055bb2fe2849655fdecec3c63a5c7775718a5f08f0b925c999bbe942ce84a725f64d48e2d3e3d2477c'
            '71d050f9456d6e58cded5431cfecdcbc585955210dac3d68e1039204597796de5ce8b8e27fb963cd095afd2b3810f9d3bc3d82995491b65e18f53539e25a9f0f'
            '21419da552c00afc5363aaf429d94de23a777a4fa4a86ad16a9f896dc981672fd2defffaa7aee36b92483997d734f33b1b897d4eeb762506fc2cb9220133c6d1'
            '5a7a9eef4623ef1ce17f7020bf14c42ea7af13254d47cc4bb17633751b2ed49295ece9c0e31a0110f5c31da492bd7e93063c6d9a5eb7e48f28eac37cf7482d8c'
            '0ed682df312d6cbb82a1190e2b58d50db97aa0bf21476f9213dc9e94a23a857ad447d8388feaf8f6733b91d5b7b13d0184de245f6c6bdf69722d8eb53258cab5'
            '8839402f873a6863831a2b676eedfe1e1197bc3c39027bd3e2ae10314c6a5a91fd4a4893dd89f684fd940c6663097b4a2495a9ef8970db64b8549a0a6da78ff5'
            'cc95e091d2cf75248d37b95b10d92fd700c0fd846eef2fb290800421ae09042b1926536e3c494ba2ff0d87e4fe4ff2f50f48692b64ba202694df2ac073b4d98a'
            '32d366428c5a4a47c0803278a91d9570720b3d3937af8a3833b1f8117b9ed5bdcc8ae35c989ffa966045aa63696c575d49c8ee759673aeed88fb50e89b91bd7b'
            '24b2dedd4592bea338877fb36eceef72c4ae5978ffb1f1d27e792a91347229555ec2b0dcf2812a44b041ac03a9f3c12777e12f9023bc5df11e59678c4ebd8a34'
            '52c8ce3aa95b8c31ea805fd9a4e7fd4f539d2983f102ea38f614d68f4a5a4af495004fe0d8fdfcd388104c6d858fbd9b944dfd85bd26f0be0255ce6961e67e41'
            'a4d8d04145a737242bbac7531dd6eda6ac1d2f9f82939f52a634106b122857c91fcda97b6509c25165f161489918f023495b0f2fe1ca8eafd6cf80ba31575323'
            'f72788eb9bc6c9f20e3efcc1d847221c92b5946003c31fee7d67310f6c624ea7817cc7412b61bd2f7516be5b031ff659fc9ca56f04d0de71d3e3c2ab4a3f8ba4'
            '86f0fac2538277a23edf3ed5fa7dca4634be19400d9da8adcee8d646444f4f81728c5ae4536ce04a05b3bea3127da7bb34ffd61eeb67cf419dbf648a4969dafa'
            '893fabb251d107088623fdb4e40b050b4eb62e9c8b24d6fd687d358b3091ab202ecf2014541af63fcbd13174eb99f9818b8aab12481e4f8f3cb7903723ddd897'
            '28fbd083d4c4fc9edb1444a82ad1871da670c60aca35ab379821e3a83388f8c3f5b405a77ffc13acc97631421253cc5106d1b105a7a90a23fe2aec9fda8a4a91'
            '063a82acf9a8818d3bc743c6bce260fc5194b25a7a1a51a778bac24fa645d1bc400bea0d8754557d225b69deacf598ac158997f9797bedd73095dae41b97392d'
            'ca4ab5ff7d4ba2bd3b20e66ac4a45a82794033804c426434b6dfa5810444287e056145c6a62d936f092bed6fdd2cf20a1ed668c6af595202a21432da3edd9e3e'
            '6ce891aeeecc8e247dd33744181c31087873c2952bcf12d73d95002c76db12f3e010bb134c9b080e78bf50f447452fdfb40970d714e2ffb6a3e8337319698f76'
            'd65bd86bc9692b709655338335e056a5da8cfb6045d25618239549a70a3cdcc0ad26aafc86c3312a9f8fd34139802104d6aced2e58cca1acb4eb7b2d6b5bc11a'
            '5d89f8c73b59e794e4ce46d341fc6391c88f4bade013450ed96b36f792465a3b94fd41d06707467c18b2d3367829c974728c4ac4a2278ea61da454609c91049b'
            '9c40c4c41a4a5edf81df48068161a1973e21fa2a40c3f7f26ac952c2daae6d26f4d0dc385a65afe2325c4cffd51172071f0d47e0ab6aa447499883006f063733'
            'ba58f4e69e4a0d2d7d0c92c9a7dc72d29f51dbc77de9a85ff53156c5de26197e2cb8b3bddb24b6285482d45bb55e29f36d7b0266f750c5218e3793c3fcd65129'
            'ee298f18237d72d37d04f5a15dad2ba814e39815bae68477041781a25cb23f9a06af436367a108a57099eb998fe7fe0b2568ebd44422a4bb77e175976f7e1337'
            '08e9ec1079820c4261d06f9fb2349ee746a4a239bad1e28e004b916d73f2761e5ee3cdf4e75bf2d5f52b4f6e3d7211258f45d8f47e214b5dc3efd8aa4633e04f'
            '47804f363ed46685b1751c0d1cb99517bd43817d07e63234be9abd1d9e08038065684f05145652cce421718ec7f8940821d71f48b7e25c2c6d587af94da329cb'
            '9b524309c0ff4edbe5de0b44aa36b0b367d5dca7a9a05644591f404ce16875a7e7dbbdd734d5e9b15c23b555c1b0169f48faa401b95b4d1d8fb912993c57e825'
            '3bcc7785d1b27b001dcd1fff44dbcd6c79c5ef546c55ab5cbb5c27d9c18d00f224603c8ae17901103dc94ad00ac768440ef2a2db04c7d1ff2d5ff285f82e6756'
            '26fd6e7cf0d4245c133cb10bd2b1f78cc695c9eb9e343bd9aa9a2dc1f45b7be245402e807a29654ed91e5f213019f07a158a387c3296c88bc4148585900d4384')
# Don't extract source archives
noextract=("${source[@]%%::*}")

package_ceph-libs-bin() {
  depends=(
    'bash'       'boost-libs'    'cryptsetup'          'curl'               'expat'
    'fmt'        'gcc-libs'      'glibc'               'gperftools'         'keyutils'
    'libaio'     'libcap'        'librabbitmq-c'       'librdkafka'         'libutil-linux'
    'libxcrypt'  'lua'           'lz4'                 'nss'                'oath-toolkit'
    'openssl'    'python'        'snappy'              'systemd-libs'       'zlib'
    'zstd'

    'python-prettytable'  'python-setuptools'  'python-yaml'
  )
  provides=('ceph-libs')
  conflicts=('ceph-libs')

  cd "${srcdir}"

  local p ; for p in "${_ceph_libs_packages[@]}"; do
    tar \
      --exclude='.*' \
      --zstd \
      -x -f "${p}_${pkgver}_${pkgrel}.tar.zst" \
      -C "${pkgdir}"
  done
}

package_ceph-bin() {
  depends=(
    "ceph-libs-bin=${pkgver}-${pkgrel}"

    'bash'     'boost-libs'     'cryptsetup'     'expat'           'fmt'
    'fuse3'    'gawk'           'gcc-libs'       'gperftools'      'libaio'
    'libcap'   'libcap-ng'      'libnl'          'librabbitmq-c'   'librdkafka'
    'lua'      'lvm2'           'oath-toolkit'   'python'          'snappy'
    'sqlite'   'systemd-libs'

    'python-bcrypt'     'python-cheroot'     'python-cherrypy'            'python-cmd2'       'python-colorama'
    'python-coverage'   'python-dateutil'    'python-importlib-metadata'  'python-jinja'      'python-jsonpatch'
    'python-packaging'  'python-pecan'       'python-prettytable'         'python-pyopenssl'  'python-requests'
    'python-scipy'      'python-setuptools'  'python-typing_extensions'   'python-urllib3'    'python-werkzeug'
    'python-yaml'
  )
  optdepends=(
    'smartmontools: disk monitoring via S.M.A.R.T'
    'nvme-cli: disk monitoring for NVMe drives'
    'cephadm: Required if cluster is managed via cephadm'
    'python-kubernetes: For mgr/module:rook,k8sevents'
    'python-numpy: For mgr/module:diskprediction_local'
    'python-influxdb: For mgr/module:influx'
  )
  backup=(
    'etc/logrotate.d/ceph'
    'etc/udev/rules.d/50-ceph-rbd.rules'
    'etc/sysctl.d/90-ceph-osd.conf'
    'etc/sudoers.d/90-ceph'
  )
  conflicts=('ceph')

  cd "${srcdir}"

  local p ; for p in "${_ceph_packages[@]}"; do
    tar \
      --exclude='.*' \
      --zstd \
      -x -f "${p}_${pkgver}_${pkgrel}.tar.zst" \
      -C "${pkgdir}"
  done
}

# vim:set ts=2 sw=2 et:
